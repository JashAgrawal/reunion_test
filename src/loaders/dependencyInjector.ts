import { Container } from 'typedi';
// import formData from 'form-data';
// import Mailgun from 'mailgun.js';
import LoggerInstance from './logger';
// import agendaFactory from './agenda';
import config from '../config';
// import StorageInstance from './googleCloudStorage';
import request from './SqlDataBase';
export default () => {
  try {
    // const mgInstance = new Mailgun(formData);
    Container.set('request', request);
    Container.set('logger', LoggerInstance);
    // Container.set('storage', StorageInstance);

    const throwError = (code = 500, message = 'huh!') => {
      let error: any = new Error(message);
      error.status = code;
      throw error;
    };
    const Nullify = value => {
      if (value) return "'" + value + "'";
      else return null;
    };
    Container.set('Nullify', Nullify);
    Container.set('throwError', throwError);

    LoggerInstance.info('✌️ Agenda injected into container');
  } catch (e) {
    LoggerInstance.error('🔥 Error on dependency injector loader: %o', e);
    throw e;
  }
};
