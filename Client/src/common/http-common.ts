import axios from 'axios';

const defaultOptions = {
    headers: {
        'Content-Type': 'application/json',
    },
};
let instance = axios.create(defaultOptions);

export default instance;