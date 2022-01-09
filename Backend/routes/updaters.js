const { Router } = require('express');
const router = Router();
const cors = require('cors');
var bodyParser = require('body-parser');

var corsOptions = { origin: true, optionsSuccessStatus: 200 };
router.use(cors(corsOptions));
router.use(bodyParser.json({ limit: '100mb', extended: true }));
router.use(bodyParser.urlencoded({ limit: '100mb', extended: true }));

router.get('/is_updaters', (req,res) => res.json
    (
        {msg: 'updaters working'}
    )
);

module.exports = router;