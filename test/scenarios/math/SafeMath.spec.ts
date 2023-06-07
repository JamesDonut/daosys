import {
    ethers,
    tracer
} from 'hardhat';
import { expect } from "chai";
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import {
    SafeMathMock,
    SafeMathMock__factory
} from '../../../typechain';
    

let SafeMathMock: SafeMathMock;

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

/* -------------------------------------------------------------------------- */
/*                       !SECTION Before Each Test Hook                       */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                           SECTION Testing SafeMath                         */
/* -------------------------------------------------------------------------- */


describe("SafeMath", function() {
    describe("tryAdd()", function () {
        it("Returns: Addition of two unsigned integers, with a overflow flag.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.tryAdd(a, b)).to.equal(true, a + b ).or.to.equal(false, 0 );
        });
    });

    describe("trySub()", function () {
        it("Returns: Substraction of two unsigned integers, with a overflow flag.", async function () {
            const a = Math.random() * -9007199254740991;
            const b = Math.random() * -9007199254740991;
            
            expect(await SafeMathMock.trySub(a, b)).to.equal(true, a - b ).or.to.equal(false, 0 );
        });
    });

    describe("tryMul()", function () {
        it("Returns: Multiplication of two unsigned integers, with a overflow flag.", async function () {
            const a = Math.random() * -9007199254740991;
            const b = Math.random() * -9007199254740991;
            
            expect(await SafeMathMock.tryMul(a, b)).to.equal(true, a * b ).or.to.equal(false, 0 );
        });
    });

    describe("tryDiv()", function () {
        it("Returns: Remainder of dividing two unsigned integers, with a division by zero flag.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.tryDiv(a, b)).to.equal(true, a / b ).or.to.equal(false, 0 );
        });
    });

    describe("tryMod()", function () {
        it("Returns: Addition of two unsigned integers, with a overflow flag.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.tryMod(a, b)).to.equal(true, a % b ).or.to.equal(false, 0 );
        });
    });

    describe("add()", function () {
        it("Returns: Addition of two unsigned integers, reverting on overflow.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.add(a, b)).to.equal(a + b).or.to.equal(0);
        });
    });

    describe("sub()", function () {
        it("Returns: Subtraction of two unsigned integers, reverts if result is negative.", async function () {
            const a = Math.random() * -9007199254740991;
            const b = Math.random() * -9007199254740991;

            expect(await SafeMathMock.add(a, b)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("mul()", function () {
        it("Returns: Multiplication of two unsigned integers, reverting on overflow.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.add(a, b)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("div()", function () {
        it("Returns: Division of two unsigned integers, reverts on zero. Result is rounded towards zero.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.add(a, b)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("mod()", function () {
        it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;

            expect(await SafeMathMock.add(a, b)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("sub()", function () {
        it("Returns: Subtraction of two unsigned integers, reverts if result is negative, with error message.", async function () {
            const a = Math.random() * -9007199254740991;
            const b = Math.random() * -9007199254740991;
            const errorMessage = 'Error';

            expect(await SafeMathMock.add(a, b, errorMessage)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("div()", function () {
        it("Returns: Division of two unsigned integers, reverts on zero. Result is rounded towards zero, with error message.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;
            const errorMessage = 'Error';

            expect(await SafeMathMock.add(a, b, errorMessage)).to.equal(a - b).or.to.equal(0);
        });
    });

    describe("mod()", function () {
        it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero, with error message.", async function () {
            const a = Math.random() * 9007199254740991;
            const b = Math.random() * 9007199254740991;
            const errorMessage = 'Error';

            expect(await SafeMathMock.add(a, b, errorMessage)).to.equal(a - b).or.to.equal(0);
        });
    });

});