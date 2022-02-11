import _ from 'lodash';

function filterParams(params: Object, whitelist: Array<any>): Object {
    const filtered = {};
    for (const key in params) {
        if (whitelist.indexOf(key) > -1) {
            filtered[key] = params[key];
        }
    }
    return filtered;
}

function isEmpty(obj: Object): Boolean {
    return _.isEmpty(obj);
}

export default {
    filterParams,
    isEmpty
}