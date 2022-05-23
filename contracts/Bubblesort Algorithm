// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract P2DToken is ERC20 {

    uint maxTopScores = 5;
    uint public amount = 10000000000000000 ;
    uint public score;
    address payable public _addr = payable(0xC0c9093Df0fefd899f82aE6735C2e0730eD9D428);

    struct TopScore{
        address addr;
        uint256 score;
    }

    TopScore[] public topScores;

    mapping(address => uint256) public _userscore;
    mapping(address => uint256) private _balances;

    constructor() ERC20("PlaytoDonate", "P2D") {}

        // token reward
        function reward(uint _score) public {
        score = _score;
        _mint(msg.sender, score);
        _userscore[msg.sender] += score;

        TopScore memory topScore = TopScore(msg.sender, score);
        topScores.push(topScore);

        // uint256 currentTopScore = _userscore[msg.sender];
        // if(currentTopScore < score){
        //     _userscore[msg.sender] = score;
        // }

        // if(topScores.length < maxTopScores){
        //     topScores.push(TopScore(msg.sender, score));

            for(uint i=0; i<topScores.length-1; i++){
                for(uint j=0; j<topScores.length-1-i; j++){
                    if(topScores[j].score < topScores[j+1].score){
                        uint currentScore = topScores[j].score;
                        topScores[j].score = topScores[j+1].score;
                        topScores[j+1].score = currentScore;
                    }
                }
            }
        //배열이 가득안찼으면 push 하는것까지는 ok .-> push하고 바로 순위 비교해서 sort 해줘야지 
        //     }else{
        //     uint256 lowestScore = 0;
        //     uint256 lowestScoreIndex = 0;
        //     for (uint256 i = 0; i < topScores.length; i++)
        //     {
        //         TopScore storage currentScore = topScores[i];
        //         if(i == 0){
        //             lowestScore = currentScore.score;
        //             lowestScoreIndex = i;
        //         }else{
        //             if(lowestScore > currentScore.score){
        //                 lowestScore = currentScore.score;
        //                 lowestScoreIndex = i;
        //             }
        //         }
        //     }
        // }


    }

// 배열의 특정 값과 for 문을 이용하여 배열의 전체 값을 불러 오기 위해 _number 라는 파라미터를 입력 받는다.
    function getUserScore(uint _number) public view returns(address user_addr, uint user_score){
        user_addr = topScores[_number].addr;
        user_score = topScores[_number].score;
    }


        // token transfer
        function send(uint256 _value) payable public {
        require(_value >= amount);
        require(_value < _balances[msg.sender]);
        ERC20.transfer(_addr, _value);
    }
}
