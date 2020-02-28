pragma solidity ^0.5.0;

//Import token contract

//Change contract name to Mutatio

contract Mutatio {
    // address public manager;
    // address payable players;

    uint public orderId;

    struct Order {
        uint depositAmount;
        address buyerAddress;
        address targetToken;
        uint amountToken;
        address exchangeAddress;
    }

    mapping (uint => Order) orders;

    event LogExchangeEth(
        uint orderId,
        uint depositAmount,
        address buyerddress,
        address targetToken,
        uint amountToken,
        bool exchangeStarted
    );

    modifier isNotStarted(uint orderId) {
        require(orders[orderId].exchangeStarted =! true)
    }
    modifier isAnExchange() {
        msg.sender == '0x4d6eC2391999Ff022A72614F7208D6cd42c34Ecc';
    }

    function exchangeEth(address _tokenAddress, uint _amountToken)
        public
        payable
        returns(uint)
    {
        Order memory thisOrder;
        thisOrder.depositAmount = msg.value;
        thisOrder.buyerAddress = msg.sender;
        thisOrder.targetToken = _tokenAddress;
        thisOrder.amountToken = _amountToken;
        orderId = orderId + 1;
        orders[orderId] = thisOrder;
        emit LogExchangeEth(orderId, msg.value, msg.sender, _tokenAddress, _amountToken);
        return  orderId;
    }

    function exchangeStarted(uint orderId)
        public
        isNotStarted()
        isAnExchange()
        returns(bool)
    {
        orders[orderId].exchangeStarted = True
    }





    // function Lottery() public {
    //     manager = msg.sender;
    // }

    // function enter() public payable {
    //     require(msg.value > .01 ether);

    //     players.push(msg.sender);
    // }

    // function random() private view returns (uint) {
    //     return uint(keccak256(block.difficulty, now, players));
    // }

    // function pickWinner() public restricted {
    //     uint index = random() % players.length;
    //     players[index].transfer(address(this).balance);
    //     players = new address[](0);
    // }

    // modifier restricted() {
    //     require(msg.sender == manager);
    //     _;
    // }

    // function getPlayers() public view returns (address[] memory) {
    //     return players;
    // }
}