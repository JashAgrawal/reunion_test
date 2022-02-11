import express from 'express';
import cors from 'cors';
import routes from '../api';
import config from '../config';
import responseHandler from 'express-response-handler';
import { isCelebrateError } from 'celebrate';
import path from 'path';
export default ({ app }: { app: express.Application }) => {
  /**
   * Health Check endpoints
   * @TODO Explain why they are here
   */
  app.get('/status', (req, res) => {
    res.status(200).end();
  });
  app.head('/status', (req, res) => {
    res.status(200).end();
  });

  // Custom Error Code
  var customCodes = [
    ['Unauthorized', 'error', 209],
    ['success', 'success', 200],
    ['Created', 'success', 201],
    ['Accepted', 'success', 202],
    ['Updated', 'success', 203],
    ['NoContent', 'success', 204],
    ['ResetContent', 'success', 205],
    ['PartialContent', 'success', 206],
    ['Deleted', 'success', 207],
    ['PartialContent', 'error', 208],
    ['AlreadyExists', 'error', 409],
    ['Default', 'error', 500]
  ];
  app.use(responseHandler(customCodes));

  // Useful if you're behind a reverse proxy (Heroku, Bluemix, AWS ELB, Nginx, etc)
  // It shows the real origin IP in the heroku or Cloudwatch logs
  app.enable('trust proxy');

  // The magic package that prevents frontend developers going nuts
  // Alternate description:
  // Enable Cross Origin Resource Sharing to all origins by default
  app.use(cors());

  // Some sauce that always add since 2014
  // "Lets you use HTTP verbs such as PUT or DELETE in places where the client doesn't support it."
  // Maybe not needed anymore ?
  app.use(require('method-override')());
  //static
  
  // Middleware that transforms the raw string of req.body into json
  app.use(express.json({ limit: '100mb' }));
  app.use(express.urlencoded({ limit: '100mb', extended: true }));
  // Load API routes
  // console.log(__dirname)
  app.use(config.api.prefix, routes());
  app.use('/upload', express.static(path.join(__dirname, '../../upload')))
  app.use((error, req, res, next) => {

    if (isCelebrateError(error)) {
      const errorParams = error.details.get('params');
      const errorBody = error.details.get('body');
      const errorHeader = error.details.get('headers');
      if (errorParams) {
        const { details: [errorDetails] } = errorParams;
        return res.error[400](errorDetails.message);
      } else if (errorBody) {
        const { details: [errorDetails] } = errorBody;
        return res.error[400](errorDetails.message);
      } else if (errorHeader) {
        const { details: [errorDetails] } = errorHeader;
        return res.error[400](errorDetails.message);
      }
    }

    res.error[error.status || 500](error.message || "Something Went Wrong");
  });
};
