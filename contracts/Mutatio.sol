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
        uint amountToken
    );

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

}