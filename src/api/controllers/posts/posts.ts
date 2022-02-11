import { Request, Response, NextFunction } from 'express';
import { Container } from 'typedi';
import posts from '../../../services/posts/posts';
import responseHandler from 'express-response-handler';
class posts_Class {
  Add_posts = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.Addposts(req);
      return res.success.success('Details Added Successfully', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  getposts = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.getposts(req);
      return res.success.success('Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  Delete_posts = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.Deleteposts(req);
      return res.success.success('Details Deleted Successfully', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  getpostsByID = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.getpostsById(req);
      return res.success.success('Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  like = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.like(req);
      return res.success.success('Details Deleted Successfully', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
  unlike = async (req: Request, res: Response | responseHandler, next: NextFunction) => {
    try {
      const postsInstance = Container.get(posts);
      let resp = await postsInstance.unlike(req);
      return res.success.success('Success', resp.Data);
    } catch (e) {
      return next(e);
    }
  };
}

export default new posts_Class();
