const express = require('express');
const app = express();

app.listen(1234, () => {
  console.log('서버 실행중 http://localhost:1234');
});

app.get('/', (req, res) => {
  res.send('안녕!!');
}); 

// 