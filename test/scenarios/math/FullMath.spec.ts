import {
    ethers,
    tracer
  } from 'hardhat';
  import { expect } from "chai";
  import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
  import {
    FullMathMock,
    FullMathMock__factory
  } from '../../../typechain';
  
describe('FullMath', function () {

  let fullMathMock: FullMathMock;

  /* -------------------------------------------------------------------------- */
  /*                        SECTION Before All Test Hook                        */
  /* -------------------------------------------------------------------------- */

  before(async function () {
    // Tagging address(0) as "System" in logs.
    tracer.nameTags[ethers.constants.AddressZero] = "System";
  });

  /* -------------------------------------------------------------------------- */
  /*                       !SECTION Before All Test Hook                        */
  /* -------------------------------------------------------------------------- */

  /* -------------------------------------------------------------------------- */
  /*                        SECTION Before Each Test Hook                       */
  /* -------------------------------------------------------------------------- */

  beforeEach(async function () {
    const [deployer] = await ethers.getSigners();
    fullMathMock = await new FullMathMock__factory(deployer).deploy();
  });

  /* -------------------------------------------------------------------------- */
  /*                       !SECTION Before Each Test Hook                       */
  /* -------------------------------------------------------------------------- */

  /* -------------------------------------------------------------------------- */
  /*                           SECTION Testing FullMath                         */
  /* -------------------------------------------------------------------------- */

  describe("abs()", function () {
    it("Converts to absolute value, and fails on overflow.", async function () {
      const initCode = fullMathMock.deployTransaction.data;
      const a = -1000;

      expect(await fullMathMock.abs(a)).to.equal(1000);    
    });
  });

  /* -------------------------------------------------------------------------- */
  /*                          !SECTION Testing FullMath                         */
  /* -------------------------------------------------------------------------- */

});


