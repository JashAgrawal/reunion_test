import { Request, Response, NextFunction } from 'express';
import { Container } from 'typedi';
import comments from '../../../services/comments/comments';
import responseHandler from 'express-response-handler';
class comments_Class {
  Add_comments = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const commentsInstance = Container.get(comments);
      let resp = await commentsInstance.Addcomments(req);
      return res.success.success('Details Added Successfully', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
}

export default new comments_Class();
