import { Request, Response, NextFunction } from 'express';
import { Container } from 'typedi';
import user from '../../../services/user/user';
import responseHandler from 'express-response-handler';
class user_Class {
  follow = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const userInstance = Container.get(user);
      let resp = await userInstance.follow(req);
      return res.success.success('Details Added Successfully', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  unFollow = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const userInstance = Container.get(user);
      let resp = await userInstance.unFollow(req);
      return res.success.success('Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };

  getuserByID = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const userInstance = Container.get(user);
      let resp = await userInstance.getuserById(req);
      return res.success.success('Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
}

export default new user_Class();
