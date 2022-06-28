/*
const calculator = require('../calculator')
var expect = require('chai').expect
//var expect = require('expect');


it('string with a single number should result in the number itself', () => {
	    expect(calculator.add('1')).to.be.equal(1);
	  });

*/

import CoverageBabel from '../calculator'

require('chai').should()

describe('CoverageBabel', function () {
  it('string with a single number should result in the number itself', function () {
    //const cls = new CoverageBabel()
    CoverageBabel.add('1').should.equal(1)
  })
})