import { Service, Inject } from 'typedi';
import Helper from '../../helpers';
import logger from '../../loaders/logger';
import request from '../../loaders/SqlDataBase';
import { v4 } from 'uuid';
@Service()
export default class posts {
  constructor(
    // @Inject('userModel') private userModel,
    @Inject('throwError') private throwError,
    @Inject('request') private request,
    // private mailer: MailerService,
    @Inject('logger') private logger,
    @Inject('Nullify') private Nullify, // @EventDispatcher() private eventDispatcher: EventDispatcherInterface,
  ) {}

  public async Addposts(req: any): Promise<{ Data: any }> {
    let [rows] = await this.request.execute(
      `CALL Add_posts(${this.Nullify(req.body.userId)},${this.Nullify(req.body.post_Id || v4())},${this.Nullify(
        req.body.Title,
      )},${this.Nullify(req.body.Description)},'','');`,
    );
    return { Data: rows[0] };
  }
  public async getposts(req: any): Promise<{ Data: any }> {
    let [rows] = await this.request.execute(`CALL Get_All_posts(${this.Nullify(req.body.userId)});`);
    let response = rows[0].map(post => {
      let res = { ...post, ...{ commentsArr: post.commentsArr.split(',') } };
      return res;
    });
    return { Data: response };
  }
  public async Deleteposts(req: any): Promise<{ Data: any }> {
    let [rows] = await this.request.execute(
      `CALL Delete_posts(${this.Nullify(this.Nullify(req.body.userId))},${this.Nullify(req.params.id)});`,
    );
    return { Data: rows[0] };
  }
  public async getpostsById(req: any): Promise<{ Data: any }> {
    let [rows] = await this.request.execute(`CALL Get_By_Id_posts(${this.Nullify(req.params.id)});`);
    let response = { ...rows[0][0], ...{ commentsArr: rows[0][0].commentsArr.split(',') } };
    return { Data: response };
  }
  public async like(req: any): Promise<{ Data: any }> {
    if (!req.body.userId) {
      this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
    }
    let [rows] = await this.request.execute(
      `Call \`like\`(${this.Nullify(req.body.userId)},${this.Nullify(req.params.id)});`,
    );
    // let q = `CALL like(${this.Nullify(req.body.userId)},${this.Nullify(req.params.id)});`;
    // console.log(q);
    // let [rows] = await this.request.execute(q);
    if (rows[0]) {
      return { Data: { Success: false, Message: rows[0][0].message } };
    }
    return { Data: { Success: true, Message: `liked post with id ${req.params.id}` } };
  }
  public async unlike(req: any): Promise<{ Data: any }> {
    if (!req.body.userId) {
      this.throwError(Helper.StatusCodes.BadRequest, 'Please provide valid data');
    }
    let [rows] = await this.request.execute(
      `CALL \`unlike\`(${this.Nullify(req.body.userId)},${this.Nullify(req.params.id)});`,
    );
    if (rows[0]) {
      return { Data: { Success: false, Message: rows[0][0].message } };
    }
    return { Data: { Success: true, Message: `unliked post with id ${req.params.id}` } };
  }
}
