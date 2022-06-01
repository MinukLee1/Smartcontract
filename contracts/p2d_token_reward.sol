// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract P2DToken is ERC20 {

    uint maxTopScores = 5;
    uint public amount = 1018 ;
    uint public score;
    address payable public _addr = payable(0xC0c9093Df0fefd899f82aE6735C2e0730eD9D428);

    struct TopScore{
        address addr;
        uint256 score;
    }
    TopScore[] public topScores;

    mapping(address => uint256) public _userscore;
    mapping(address => uint256) public _accumulate;

    constructor() ERC20("PlaytoDonate", "P2D") {}

    // token reward
    function reward(uint _score) public {
    require(_score >= amount);

         score = _score / (1018);
        _mint(msg.sender, _score);

        _userscore[msg.sender] = _score;
        _accumulate[msg.sender] += _score;

        TopScore memory topScore = TopScore(msg.sender, score);
        topScores.push(topScore);

        for(uint i=0; i<topScores.length-1; i++){
            for(uint j=0; j<topScores.length-1-i; j++){
                if(topScores[j].score < topScores[j+1].score){
                   // uint currentScore = topScores[j].score;
                    TopScore memory currentScore = topScores[j];
                    topScores[j] = topScores[j+1];
                    topScores[j+1]= currentScore;
                }
            }
        }
    }

    // token transfer
    function send(uint256 _value) payable public {
    require(_value >= amount);
    ERC20.transfer(_addr, _value);
    }

    // 배열의 특정 값과 for 문을 이용하여 배열의 전체 값을 불러 오기 위해 _number 라는 파라미터를 입력 받는다.
    function getUserScore(uint _number) public view returns(address user_addr, uint user_score){
        user_addr = topScores[_number].addr;
        user_score = topScores[_number].score;
    }
}
