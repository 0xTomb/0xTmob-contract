// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Weathering {
    mapping(uint => uint) public WeatheringTimes;

    function _addWeatheringTimes(uint _tokenID) internal {
        WeatheringTimes[_tokenID]++;
    }
}
