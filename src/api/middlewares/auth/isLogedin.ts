import { Container } from 'typedi';
const jwt = require('jsonwebtoken');
import StatusCodeHelper from '../../../helpers/StatusCodes';

const isLogedIn = async (req, res, next) => {
  try {
    req.headers.authorization;
    const throwError = Container.get('throwError') as Function;
    if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Token') {
      jwt.verify(req.headers.authorization.split(' ')[1], process.env.JWT_SECRET, function (err, decoded) {
        if (decoded.User_id) {
          console.log(decoded.User_id);
          next();
          return;
        } else {
          throwError(StatusCodeHelper.Unauthorized, 'Unauthorized1');
        }
      });
    } else {
      throwError(StatusCodeHelper.Unauthorized, 'Unauthorized2');
    }
    return;
  } catch (e) {
    return next(e);
  }
};

export default isLogedIn;
