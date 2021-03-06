// Указываем версию солидити для компилятора
pragma solidity ^0.4.11;


//Объявляем контракт
contract LessSimpleContract {


    // Объявляем переменную donator, в которой будет содержаться значение типа Адрес
    // Public означает, что значение этой переменной будет видно всем
    address public donator;
    // Объявляем переменную owner, в которой будет содержаться значение типа Адрес
    address public owner;


    // Объявляем переменную value, в которой будет содержаться значение типа uint
    uint public value;


    // Объявляем переменную lastTimeForDonate, в которой будет содержаться значение типа uint
    uint public lastTimeForDonate;
    // Объявляем переменную lastTimeForValue, в которой будет содержаться значение типа uint
    uint public lastTimeForValue;
    // Объявляем переменную timeOut, в которой будет содержаться заранее определенное значение типа uint
    uint timeOut = 120 seconds;

    // Эта функция выполнится в момент инициализации контракта
    function LessSimpleContract(){
        // Присваиваем переменной owner значение адреса того, кто задеплоил смартконтракт
        owner = msg.sender;

    }

    // Функция для приема эфиров
    // Отсутвие названия говорит о том, что эта функция будет вызвана в момент,
    // когда на адрес контракта переводятся деньги
    // payable - модификатор который означает, что вместе с вызовом функции могут передаваться эфиры
    function () public payable {
        // Проверяем, что достаточное количество средств переведено
        require(msg.value > 1 finney);
        // Проверяем, что выполнено условие по времени
        require(lastTimeForDonate + timeOut < now);
        // Вызываем внутреннюю функцию
        setDonator(msg.sender);
    }


    // Функция для приема эфиров и установки значения
    // Функция принимает переменную _value в формате uint
    // payable - модификатор который означает, что вместе с вызовом функции могут передаваться эфиры
    function buyValue(uint _value) public payable {
        // Проверяем, что достаточное количество средств переведено
        require(msg.value > 1 finney);
        // Проверяем, что выполнено условие по времени
        require(lastTimeForValue + timeOut < now);
        // Вызываем внутреннюю функцию
        setValue(_value);
    }


    // Функция установки нового значения
    // internal означает, что эта функция недоступна для вызова вне контракта
    // (uint _value) означает, что функция принимает значение типа uint, которое потом будет
    // доступно по имени _value
    function setValue(uint _value) internal {
        // Присваиваем переменной value значение, находящегося в переменной _value
        value = _value;
        lastTimeForValue = now;
    }


    // Функция для установки нового donator
    // internal означает, что эта функция недоступна для вызова вне контракта
    // (address _donator) означает, что функция принимает значение типа адрес, которое потом будет
    // доступно по имени _donator
    function setDonator(address _donator) internal {
        // Присваиваем переменной donator значение адреса, находящегося в переменной _donator
        donator = _donator;
        lastTimeForDonate = now;
    }

}