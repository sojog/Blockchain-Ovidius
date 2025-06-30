
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;





interface ERC721 /* is ERC165 */ {

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    function balanceOf(address _owner) external view returns (uint256);

    function ownerOf(uint256 _tokenId) external view returns (address);

}


interface ERC721Metadata /* is ERC721 */ {

    function name() external view returns (string memory name);
    function symbol() external view returns (string memory _symbol);
    function tokenURI(uint256 _tokenId) external view returns (string memory);


}


// 1 -> 0xabc, 2 -> 0xmno

contract OvidiusNFT  is ERC721, ERC721Metadata{
    

    // event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    string public name = "OvidiusNFT";
    string public symbol = "OVDNFT";


    uint256 private tokenIDCounter =  0;

    // cei care detin
    mapping(uint256 => address ) private owners;
    mapping(address => uint256 ) private  balances;

    function balanceOf(address _owner) external view returns (uint256) {
         
         require( _owner !=  address(0), "Adresa zero nu este permisa");
         return balances[_owner];
    }


    function ownerOf(uint256 _tokenID) public view returns (address){ 
        
        address _owner = owners[_tokenID];
        require(_owner !=  address(0), "Tokenul nu exista");
        return _owner;        
    }

    function mint() public {
        uint256 currentTokenId = tokenIDCounter;
        currentTokenId += 1;
    
        owners[currentTokenId] = msg.sender;
        balances[msg.sender] += 1;

        tokenIDCounter = currentTokenId;

    }

     function transferFrom(address _from, address _to, uint256 _tokenId) external payable{
        require(msg.sender == _from, "Ne ai perm");
        require(owners[_tokenId] == _from, "Ne ai permisiune de a trimite acest contract");
        require(_to != address(0), "Adresa zero nu este permisa");



        owners[_tokenId] = _to;
        balances[_to] += 1;
        balances [_from] -=1;


        emit Transfer( _from,  _to,  _tokenId);

     }

      function tokenURI(uint256 _tokenId) external pure returns (string memory) {

            return string(abi.encodePacked("https://bafybeiajx2q3u4746agjiyk572h2fnjfqb4hx6obagd4a56ob7ucq5fu4i.ipfs.dweb.link/", _tokenId));
      }



    // Varianta mai costisitoare  - cu 2 citiri din storage
    // function ownerOf2(uint256 _tokenID) public view returns (address){   
    //     require(owners[_tokenID] !=  address(0), "Tokenul nu exista");
    //     return owners[_tokenID];
    // }




}
