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
                const a = Math.random() * 9007199254740991;
                const b = Math.random() * 9007199254740991;

                expect(await mathMock.add(a, b)).to.equal(a + b).or.to.equal(0);
            });
        });

        describe("sub()", function () {
            it("Returns: Substitution of two unsigned integers, reverting negative overflow.", async function () {
                const a = Math.random() * -9007199254740991;
                const b = Math.random() * -9007199254740991;

                expect(await mathMock.sub(a, b)).to.equal(a - b).or.to.equal(0);
            });
        });

        describe("mul()", function () {
            it("Returns: Multiplication of two unsigned integers, reverting overflow.", async function () {
                const a = Math.random() * 9007199254740991;
                const b = Math.random() * 9007199254740991;

                expect(await mathMock.mul(a, b)).to.equal(a * b).or.to.equal(0);
            });
        });

        describe("div()", function () {
            it("Returns: Division of two unsigned integers, checking for divisor to not be zero.", async function () {
                const a = Math.random() * 9007199254740991;
                const b = Math.random() * 9007199254740991;

                expect(await mathMock.div(a, b)).to.equal(a / b).or.to.equal(0);
            });
        });

        describe("mod()", function () {
            it("Returns: Addition of two unsigned integers, checking for divisor to not be zero.", async function () {
                const a = Math.random() * 9007199254740991;
                const b = Math.random() * 9007199254740991;

                expect(await mathMock.mod(a, b)).to.equal(a % b).or.to.equal(0);
            });
        });

        describe("sqrrt()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero.", async function () {
                const a = Math.random() * 9007199254740991;
    
                expect(await mathMock.sqrrt(a)).to.equal(a * a).or.to.equal(1);
            });
        });    

        describe("percentageAmount()", function () {
            it("Returns: Subtraction of two unsigned integers, reverts with custom message on negative overflow", async function () {
                const total = Math.random() * 9007199254740991;
                const precentage = Math.random() * 9007199254740991;
                
                expect(await mathMock.percentageAmount(total, precentage)).to.equal( (total * precentage) / 1000 );
            });
        });
    
        describe("substractPercentage()", function () {
            it("Returns: Division of two unsigned integers, reverts with custom message on zero. Result is rounded towards zero.", async function () {
                const total = Math.random() * 7199254740991;
                const precentageToSub = Math.random() * 7199254740991;
                
                expect(await mathMock.substractPercentage(total, precentageToSub)).to.equal( total - ((total * precentageToSub) / 1000) );
            });
        });
    
        describe("percentageOfTotal()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const part = Math.random() * 9007199254740991;
                const total = Math.random() * 9007199254740991;
                
                expect(await mathMock.percentageOfTotal(part, total)).to.equal( (part * 100) / total);
            });
        });
    
        describe("average()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const a = Math.random() * 9007199254740991;
                const b = Math.random() * 9007199254740991;
                
                expect(await mathMock.average(a, b)).to.equal( (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2) );
            });
        });
    
        describe("quadraticPricing()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const payment = Math.random() * 199254740991;
                const multiplier = Math.random() * 199254740991;
    
                const result = (multiplier * payment) * (multiplier * payment);
                
                expect(await mathMock.quadraticPricing(payment, multiplier)).to.equal(result);
            });
        });
    
        describe("bondingCurve()", function () {
            it("Returns: Remainder of dividing two unsigned integers, reverts with custom message when dividing by zero.", async function () {
                const supply = Math.random() * 7199254740991;
                const multiplier = Math.random() * 7199254740991;
                
                expect(await mathMock.bondingCurve(supply, multiplier)).to.equal(multiplier * supply);
            });
        });

    });

    /* -------------------------------------------------------------------------- */
    /*                           SECTION Testing Math                             */
    /* -------------------------------------------------------------------------- */

});
