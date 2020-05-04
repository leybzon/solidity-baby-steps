pragma solidity >=0.4.22 <0.6.0;

contract OpenSesame{
   enum State { Locked, Unlocked }
   State public state;
   uint public value; //value to unlock

   address payable public seller;
   
   event Unlock();
   event Lock();

   constructor() public {
      value = 1000;
      state = State.Locked;
      seller = msg.sender;
   }

    modifier inState(State _state) {
        require(
            state == _state,
            "Invalid state."
        );
        _;
    }

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    modifier onlySeller() {
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }

   function unlock()
        public
        inState(State.Locked)
        condition(msg.value > value)
        payable
    {
        state = State.Unlocked;
        emit Unlock();
    }

   function lock(uint _value)
        public
	onlySeller
        inState(State.Unlocked)
    {
        value = _value;
        state = State.Locked;
        emit Lock();
    }
}
