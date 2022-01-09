const express = require('express');
const morgan = require('morgan');
const app = express();

app.use(morgan('dev'));
app.use(require('./routes/selectors'));
app.use(require('./routes/creators'));
app.use(require('./routes/updaters'));
app.use(require('./routes/deleaters'));

app.get('/', (req, res) => {
  res.send('<br><br><br><hr><center><h1>Cindy server-side is running</h1></center><hr>')
});

async function main()
{
    await app.listen(3010);
    console.log('Server in port 3010');
}

main();