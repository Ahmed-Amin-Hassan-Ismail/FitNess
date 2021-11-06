# FitNess
 FitNess is the premier fitness-coaching app based on the “Loch Ness” workout. Users have to outrun, outswim or outclimb Nessie, the fitness monster. The goal of the app is to motivate user movement by having them outpace Nessie. If they fail, their avatar gets eaten.
 
 ---------------------------------------------
 ---------------------------------------------
 
 # Unit Test 
 
## Red-Green-Refactor

The name of the game in TDD is red, green, refactor. This means iteratively writing tests in this fashion:
1. Write a test that fails (red).
2. Write the minimum amount of code so the test passes (green).
3. Clean up test(s) and code as needed (refactor).
4. Repeat the process until all the logic cases are covered.


Structure of XCTestCase subclass :
XCTest : is in the family of test frameworks dervied from XUnit

- so now what is XUnit ? 
XUnit : It's an architecture for running unit tests. 
The "X" is a stand-in for the programming language
such as : in Java it's JUnit, and in Objective-C it's OCUnit. In Swift, it's just XCTest. 

- Test cases are grouped together into a test suite.
- Test runner is a program that knows how to find test cases in the suite
- Test case class has a setUp() and tearDown() method that is used to set up global and class state before and after each test method is run
