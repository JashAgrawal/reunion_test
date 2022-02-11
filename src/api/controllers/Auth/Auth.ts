import { Request, Response, NextFunction } from 'express';
import { Container } from 'typedi';
import Auth from '../../../services/Auth/Auth';
import responseHandler from 'express-response-handler';
class Auth_Class {
  Login = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const AuthInstance = Container.get(Auth);
      let resp = await AuthInstance.Login(req);
      res.cookie('User_token', resp.Data.Token, { httpOnly: true, maxAge: 1000 * 60 * 60 * 24 * 3 });
      return res.success.success('Login Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
}

export default new Auth_Class();
