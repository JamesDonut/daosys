import {
    ethers,
    tracer
} from 'hardhat';
import { expect } from "chai";
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import {
    MathMock,
    MathMock__factory
} from '../../../typechain';
  
describe('FullMath', function () {

    let mathMock: MathMock;

    /* -------------------------------------------------------------------------- */
    /*                        SECTION Before All Test Hook                        */
    /* -------------------------------------------------------------------------- */

    /* -------------------------------------------------------------------------- */
    /*                       !SECTION Before All Test Hook                        */
    /* -------------------------------------------------------------------------- */

    /* -------------------------------------------------------------------------- */
    /*                        SECTION Before Each Test Hook                       */
    /* -------------------------------------------------------------------------- */

    /* -------------------------------------------------------------------------- */
    /*                       !SECTION Before Each Test Hook                       */
    /* -------------------------------------------------------------------------- */

    /* -------------------------------------------------------------------------- */
    /*                           SECTION Testing Math                             */
    /* -------------------------------------------------------------------------- */


    describe("Math", function() {
        describe("add()", function () {
            it("Returns: Addition of two unsigned integers, reverting overflow.", async function () {
                const a = 2000;
                const b = 50;

                expect(await mathMock.add(a, b)).to.equal(2050);
            });
        });

        describe("sub()", function () {
            it("Returns: Substitution of two unsigned integers, reverting negative overflow.", async function () {
                const a = 2000;
                const b = 50;

                expect(await mathMock.sub(a, b)).to.equal(1950);
            });
        });

        describe("mul()", function () {
            it("Returns: Multiplication of two unsigned integers, reverting overflow.", async function () {
                const a = 2000;
                const b = 50;

                expect(await mathMock.mul(a, b)).to.equal(100000);
            });
        });

        describe("div()", function () {
            it("Returns: Division of two unsigned integers, checking for divisor to not be zero.", async function () {
                const a = 2000;
                const b = 50;

                expect(await mathMock.div(a, b)).to.equal(40);
            });
        });

        describe("mod()", function () {
            it("Returns: Addition of two unsigned integers, checking for divisor to not be zero.", async function () {
                const a = 2000;
                const b = 50;

                expect(await mathMock.mod(a, b)).to.equal(0);
            });
        });

        describe("sqrrt()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero.", async function () {
                const a = 50;
    
                expect(await mathMock.sqrrt(a)).to.equal(2500);
            });
        });    

        describe("percentageAmount()", function () {
            it("Returns: Subtraction of two unsigned integers, reverts with custom message on negative overflow", async function () {
                const total = 2000;
                const precentage = 50;
                
                expect(await mathMock.percentageAmount(total, precentage)).to.equal(100);
            });
        });
    
        describe("substractPercentage()", function () {
            it("Returns: Division of two unsigned integers, reverts with custom message on zero. Result is rounded towards zero.", async function () {
                const total = 2000;
                const precentageToSub = 50;
                
                expect(await mathMock.substractPercentage(total, precentageToSub)).to.equal(1900);
            });
        });
    
        describe("percentageOfTotal()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const part = 2000;
                const total = 50;
                
                expect(await mathMock.percentageOfTotal(part, total)).to.equal(4000);
            });
        });
    
        describe("average()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const a = 2000;
                const b = 50;
                
                expect(await mathMock.average(a, b)).to.equal(1025);
            });
        });
    
        describe("quadraticPricing()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const payment = 200;
                const multiplier = 50;
                
                expect(await mathMock.quadraticPricing(payment, multiplier)).to.equal(100);
            });
        });
    
        describe("bondingCurve()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const supply = 200;
                const multiplier = 50;
                
                expect(await mathMock.bondingCurve(supply, multiplier)).to.equal(10000);
            });
        });

    });

    /* -------------------------------------------------------------------------- */
    /*                           SECTION Testing Math                             */
    /* -------------------------------------------------------------------------- */

});
