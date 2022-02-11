import { Service, Inject } from 'typedi';
import Helper from '../../helpers';
import logger from '../../loaders/logger';
import request from '../../loaders/SqlDataBase';
import { v4 } from 'uuid';
@Service()
export default class user {
  constructor(
    // @Inject('userModel') private userModel,
    @Inject('throwError') private throwError,
    @Inject('request') private request,
    // private mailer: MailerService,
    @Inject('logger') private logger,
    @Inject('Nullify') private Nullify, // @EventDispatcher() private eventDispatcher: EventDispatcherInterface,
  ) {}
  public async getuserById(req: any): Promise<{ Data: any }> {
    if (!req.body.userId) {
      this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
    }
    let [userDataResponse] = await this.request.execute(`CALL Get_By_Id_user(${req.body.userId});`);
    // let response = {
    //   userName: userDataResponse[0][0].userName,
    //   no_of_followers: userDataResponse[0][0].no_of_followers,
    //   following: userDataResponse[0][0].following,
    // };
    return { Data: userDataResponse[0][0] };
  }

  public async follow(req: any): Promise<{ Data: any }> {
    if (!req.body.userId) {
      this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
    }
    let [userDataResponse] = await this.request.execute(
      `CALL follow(${this.Nullify(req.body.userId)}, ${this.Nullify(req.params.id)});`,
    );
    if (userDataResponse[0]) {
      return { Data: { Success: false, Message: userDataResponse[0][0].message } };
    }
    return { Data: { Success: true, Message: `Followed User with id ${req.params.id}` } };
  }
  public async unFollow(req: any): Promise<{ Data: any }> {
    if (!req.body.userId) {
      this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
    }
    let [userDataResponse] = await this.request.execute(
      `CALL unfollow(${this.Nullify(req.body.userId)}, ${this.Nullify(req.params.id)});`,
    );
    if (userDataResponse[0]) {
      return { Data: { Success: false, Message: userDataResponse[0][0].message } };
    }
    return {
      Data: { Success: true, Message: `Unfollowed User with id ${req.params.id}` },
    };
  }
}
