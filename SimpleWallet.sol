pragma solidity ^0.5.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "./Allowance.sol"


contract SimpleWallet is Allowance {

    function withdrawMoney(address payable _to,uint _amount) public ownerOrAllowed(_amount) {
        require(_amount < address(this).balance,'There are not enough funds in the smart contract');
        if(!isOwner()) {
            reduceAllowance(msg.sender,_amount);
        }
        _to.transfer(_amount);
    }

    function () external payable {
        
    }
}