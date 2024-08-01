import Debug "mo:base/Debug";
import Time "mo:base/Time";
// import Nat "mo:base/Nat";
import Float "mo:base/Float";

actor DBank {
    stable var currentValue :Float = 500; // by stable key word state is preserved othogonal persistence it remains as it is
    // currentValue := 300;

   stable var startTime = Time.now();
    // let id = 34;

    // Debug.print(debug_show ("hello world" ,currentValue,id));

    public func topUp(amount : Float) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    public func withdrawl(amount : Float) {
        let tempValue :Float = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print(debug_show (currentValue));
        } else {
            Debug.print("The amount in the bank is insufficient.");
        };
    };

    // update function and query functions

    public query func checkBalance() : async Float {
        //read only so fast
        return currentValue;
    };

    // type Time=Int;
    // var now : () -> Time;

    public func compound() {
        var currentTime = Time.now();
        var timeElapsedNS = currentTime -startTime;
        var timeInSeconds = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeInSeconds));
        Debug.print(debug_show (timeInSeconds));
        startTime := currentTime;
    };

};
