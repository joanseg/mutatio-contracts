const Mutatio = artifacts.require('Mutatio');

// exceptionsHelpers.js will facilitate some functions to test our contract
// let catchRevert = require("./exceptionsHelpers.js").catchRevert;

const BN = web3.utils.BN;

let accounts;
// let inbox;

  const tokenAddress = '0x95a1f215181f7576F2ad61e6310B3Ad93b1C4F21'
  const amountToken = '100'

  beforeEach( async ()=> {
      // Get list of all accounts       
      accounts = await web3.eth.getAccounts();
      
      // lottery = await Mutatio.new();
      mutatio = await Mutatio.new();

  });

  describe('Mutatio Contract', () => {
      it('deploys a contract', () => {
        assert.ok(mutatio.options.address);
      });

      it('deposit function should emit an event with the exchange parameters', async () => {
        await mutatio.methods.deposit(
          tokenAddress, 
          amountToken
        )
    

      });
    
      it('allows multiple accounts to enter', async () => {
        await lottery.methods.enter().send({
          from: accounts[0],
          value: web3.utils.toWei('0.02', 'ether')
        });
        await lottery.methods.enter().send({
          from: accounts[1],
          value: web3.utils.toWei('0.02', 'ether')
        });
        await lottery.methods.enter().send({
          from: accounts[2],
          value: web3.utils.toWei('0.02', 'ether')
        });
    
        const players = await lottery.methods.getPlayers().call({
          from: accounts[0]
        });
    
        assert.equal(accounts[0], players[0]);
        assert.equal(accounts[1], players[1]);
        assert.equal(accounts[2], players[2]);
        assert.equal(3, players.length);
      });
    
      it('requires a minimum amount of ether to enter', async () => {
        try {
          await lottery.methods.enter().send({
            from: accounts[0],
            value: 0
          });
          assert(false);
        } catch (err) {
          assert(err);
        }
      });
    
      it('only manager can call pickWinner', async () => {
        try {
          await lottery.methods.pickWinner().send({
            from: accounts[1]
          });
          assert(false);
        } catch (err) {
          assert(err);
        }
      });
    
      it('sends money to the winner and resets the players array', async () => {
        await lottery.methods.enter().send({
          from: accounts[0],
          value: web3.utils.toWei('2', 'ether')
        });
    
        const initialBalance = await web3.eth.getBalance(accounts[0]);
        await lottery.methods.pickWinner().send({ from: accounts[0] });
        const finalBalance = await web3.eth.getBalance(accounts[0]);
        const difference = finalBalance - initialBalance;
    
        assert(difference > web3.utils.toWei('1.8', 'ether'));
      });
    });