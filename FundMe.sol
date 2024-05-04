// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe {
    uint256 public minimumUsd = 50 * 1e18;
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
    function fund() public payable {
        //we want to be able to set a minimum amount in USD
        //1. how do we send ETH to this contract
        require(getConvertionRate(msg.value )>= minimumUsd, "Did'nt send enough"); //1e18 = 1 * 10 ** 18 == 1000000000000000000 //18 decimals
        
        //what is revert
        //undo any action before, and send remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns (uint256) {
    //since you need a data from outside our contract or we the folllowing things
    //ADB
    //Address 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
    AggregatorV3Interface  priceFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
    (,int256 price,,,) = priceFeed.latestRoundData();
    //ETH in terms of USD
    //300.00000000 //8decimals
    return uint256 (price * 1e10); //1**10 100000000000
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        return priceFeed.version();
    }

    function getConvertionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        //3000_000000000000000000000 ETH /USD price
        //1_000000000000 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
    //function withdraw(){}
}