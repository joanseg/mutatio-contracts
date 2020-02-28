const Mutatio = artifacts.require('Mutatio');

// exceptionsHelpers.js will facilitate some functions to test our contract
// let catchRevert = require("./exceptionsHelpers.js").catchRevert;

const BN = web3.utils.BN;

let mutatio;

  const tokenAddress = '0x95a1f215181f7576F2ad61e6310B3Ad93b1C4F21'
  const amountToken = '100'

  beforeEach( async ()=> {
      // Get list of all accounts       
      accounts = await web3.eth.getAccounts();
      mutatio = await Mutatio.new();
  });

  describe('Mutatio Contract', () => {
      it('deploys a contract', () => {
        assert.ok(mutatio.address);
      });

      it('deposit function should emit an event with the exchange parameters', async () => {
        const tx = await mutatio.exchangeEth(
          tokenAddress, 
          amountToken
        );
        const events = tx.logs[0].args;
        console.log(tokenAddress, events.targetToken);
        assert.equal(amountToken, events.amountToken);
      });
    });