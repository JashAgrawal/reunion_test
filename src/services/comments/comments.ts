import { Service, Inject } from 'typedi';
import Helper from '../../helpers';
import logger from '../../loaders/logger';
import request from '../../loaders/SqlDataBase';
import { v4 } from 'uuid';
@Service()
export default class comments {
  constructor(
    // @Inject('userModel') private userModel,
    @Inject('throwError') private throwError,
    @Inject('request') private request,
    // private mailer: MailerService,
    @Inject('logger') private logger,
    @Inject('Nullify') private Nullify, // @EventDispatcher() private eventDispatcher: EventDispatcherInterface,
  ) {}

  public async Addcomments(req: any): Promise<{ Data: any }> {
    let newCommentId = v4();
    let [rows] = await this.request.execute(
      `CALL Add_comments(${this.Nullify(newCommentId)}, ${this.Nullify(req.body.comment)}, ${this.Nullify(
        req.params.id,
      )});`,
    );
    return { Data: { CommentId: newCommentId } };
  }
}
