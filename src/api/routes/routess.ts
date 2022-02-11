import { Router } from 'express';
import middlewares from '../middlewares';
import Validation from '../validations';
import Controller from '../controllers';
const route = Router();
const App_Name = 'Auto';
export default (app: Router) => {
  app.use(`/${App_Name}`, route);
  //authHere
  route.post('/Login', Controller.Auth.Login);
  route.use(middlewares.isLogedin);
  route.post('/follow/:id', Controller.user.follow);
  route.post('/unfollow/:id', Controller.user.unFollow);
  route.get('/Get_By_Id_user', Controller.user.getuserByID);
  route.post('/Add_posts', Controller.posts.Add_posts);
  route.delete('/Delete_posts/:id', Controller.posts.Delete_posts);
  route.post('/like/:id', Controller.posts.like);
  route.post('/unlike/:id', Controller.posts.unlike);
  route.post('/Add_comments/:id', Controller.comments.Add_comments);
  route.get('/Get_By_Id_posts/:id', Controller.posts.getpostsByID);
  route.get('/Get_All_posts', Controller.posts.getposts);

  //addHere
};
