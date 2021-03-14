import express from 'express';
const app = express();

const PORT = 8080;
const HOST = '0.0.0.0';

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(PORT, HOST, () => {
  // tslint:disable-next-line
  console.log(`Example app listening at http://localhost:${PORT}`);
});
