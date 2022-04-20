const { expect } = require("chai");

const chai = require("chai");
const BN = require("bn.js");


// Enable and inject BN dependency
chai.use(require("chai-bn")(BN));