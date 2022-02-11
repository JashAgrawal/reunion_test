import { Service, Inject } from 'typedi';
import Helper from '../../helpers';
import argon2 from 'argon2';
var jwt = require('jsonwebtoken');

@Service()
export default class Api {
  constructor(
    @Inject('throwError') private throwError,
    @Inject('request') private request,
    @Inject('logger') private logger,
    @Inject('Nullify') private Nullify,
  ) {}

  public async Login(req: any): Promise<{ Data: any }> {
    try {
      let { Email, Password } = req.body;
      let self = this;
      let success = false;
      let return_value = {};
      if (Email == (null || undefined) || Password == (null || undefined)) {
        this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
      }
      let [rowss] = await this.request.execute(`CALL get_user_details_By_Email(${this.Nullify(Email)});`);
      // console.log(rowss[0][0]);
      if (rowss[0][0]) {
        let Password_Hash = rowss[0][0].passwordHash;
        const validPassword = await argon2.verify(Password_Hash, Password);
        if (validPassword) {
          success = true;
          var Token = jwt.sign({ User_id: rowss[0][0].id }, process.env.JWT_SECRET, {
            expiresIn: '3d',
          });
          return_value = { Id: rowss[0][0].id, Token };
        } else {
          self.throwError(Helper.StatusCodes.BadRequest, 'Incorrect Password');
        }
      } else {
        this.throwError(Helper.StatusCodes.BadRequest, 'Email Not Found');
      }
      return { Data: return_value };
    } catch (err) {
      console.log(err);
      this.throwError(Helper.StatusCodes.InternalError, 'Something Went Wrong');
    }
  }

  // catch (e) {
  //   console.log(e);
  //   return { Data: return_value }
  // }
}
