CPATH='.;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission/

if [ -f "ListExamples.java" ]
then
    echo "ListExamples found"
else
    echo "need file ListExamples.java"
    exit 1
fi

cd ..

rm -rf test-submission
mkdir test-submission
cp student-submission/*.java test-submission
cp *.java test-submission
echo "it copied successfully"


cd test-submission

javac -cp $CPATH *.java
if [[ $? -ne 0 ]]
then 
    echo "involving javac-error.txt"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
