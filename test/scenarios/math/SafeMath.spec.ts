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
    
describe('SafeMath', function() {

let safeMathMock: SafeMathMock;

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
    safeMathMock = await new SafeMathMock__factory(deployer).deploy();
});

/* -------------------------------------------------------------------------- */
/*                       !SECTION Before Each Test Hook                       */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                           SECTION Testing SafeMath                         */
/* -------------------------------------------------------------------------- */

    describe("tryAdd()", function () {
        it("Returns: Addition of two unsigned integers, with a overflow flag.", async function () {
            const a = 200;
            const b = 50;

            const [x, y] = await safeMathMock.tryAdd(a, b);

            expect(x).to.equal(true);
            expect(y).to.equal(250);
           
        });
    });

    describe("trySub()", function () {
        it("Returns: Substraction of two unsigned integers, with a overflow flag.", async function () {
            const a = 200;
            const b = 50;

            const [x, y] = await safeMathMock.trySub(a, b);

            expect(x).to.equal(true);
            expect(y).to.equal(150);
            
        });
    });

    describe("tryMul()", function () {
        it("Returns: Multiplication of two unsigned integers, with a overflow flag.", async function () {
            const a = 200;
            const b = 50;
            
            const [x, y] = await safeMathMock.tryMul(a, b);

            expect(x).to.equal(true);
            expect(y).to.equal(10000);

        });
    });

    describe("tryDiv()", function () {
        it("Returns: Remainder of dividing two unsigned integers, with a division by zero flag.", async function () {
            const a = 200;
            const b = 50;

            const [x, y] = await safeMathMock.tryDiv(a, b);

            expect(x).to.equal(true);
            expect(y).to.equal(4);

        });
    });

    describe("tryMod()", function () {
        it("Returns: Addition of two unsigned integers, with a overflow flag.", async function () {
            const a = 200;
            const b = 50;

            const [x, y] = await safeMathMock.tryMod(a, b);

            expect(x).to.equal(true);
            expect(y).to.equal(0);

        });
    });

    describe("add()", function () {
        it("Returns: Addition of two unsigned integers, reverting on overflow.", async function () {
            const a = 200;
            const b = 50;

            expect(await safeMathMock.add(a, b)).to.equal(250);
        });
    });

    describe("sub()", function () {
        it("Returns: Subtraction of two unsigned integers, reverts if result is negative.", async function () {
            const a = 200;
            const b = 50;

            expect(await safeMathMock.sub(a, b)).to.equal(150);
        });
    });

    describe("mul()", function () {
        it("Returns: Multiplication of two unsigned integers, reverting on overflow.", async function () {
            const a = 200;
            const b = 50;

            expect(await safeMathMock.mul(a, b)).to.equal(10000);
        });
    });

    describe("div()", function () {
        it("Returns: Division of two unsigned integers, reverts on zero. Result is rounded towards zero.", async function () {
            const a = 200;
            const b = 50;

            expect(await safeMathMock.div(a, b)).to.equal(4);
        });
    });

    describe("mod()", function () {
        it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero.", async function () {
            const a = 200;
            const b = 50;

            expect(await safeMathMock.mod(a, b)).to.equal(0);
        });
    });

    describe("subError()", function () {
        it("Returns: Subtraction of two unsigned integers, reverts if result is negative, with error message.", async function () {
            const a = 200;
            const b = 50;
            const errorMessage = 'Error';

            expect(await safeMathMock.subError(a, b, errorMessage)).to.equal(150);
        });
    });

    describe("divError()", function () {
        it("Returns: Division of two unsigned integers, reverts on zero. Result is rounded towards zero, with error message.", async function () {
            const a = 200;
            const b = 50;
            const errorMessage = 'Error';

            expect(await safeMathMock.divError(a, b, errorMessage)).to.equal(4);
        });
    });

    describe("modError()", function () {
        it("Returns: Remainder of dividing two unsigned integers, reverts when dividing by zero, with error message.", async function () {
            const a = 200;
            const b = 50;
            const errorMessage = 'Error';

            expect(await safeMathMock.modError(a, b, errorMessage)).to.equal(0);
        });
    });

});