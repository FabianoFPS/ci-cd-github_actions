const request = require('supertest');

const { app } = require('../index');

describe('GET /', () => {
  it('responds with Hello word', (done) => {
    const user = process.env.HEROKU_VAR_VALUE || 'Not found';
    request(app).get('/').expect(`Hello word ${user}!`, done)
  })
});
