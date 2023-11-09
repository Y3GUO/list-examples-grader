CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

#  1.
FOUND=$(find student-submission -type f -name "ListExamples.java")

# Check if the ListExamples.java file is found
if [[ -z "$FOUND" ]]
then
    echo "Error: ListExamples.java file is missing in the repository."
    exit 1
else
    echo "ListExamples.java file found at $FOUND"
fi

#3.
cp -r student-submission/* grading-area/
cp -r TestListExamples.java grading-area/

cd grading-area
javac ListExamples.java 
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test_output.txt
#4.
set +e

# Attempt to compile the Java files. Output and errors are redirected to files.
javac ListExamples.java 2> compile_errors.txt
compile_exit_code=$?

# Check if compilation was successful (error code is 0)
if [[ $compile_exit_code -ne 0 ]]
then
  echo "Compilation failed. Here's the output:"
  # Output the compilation errors
  cat compile_errors.txt
  exit $compile_exit_code
else
  echo "Compilation successful."
fi

#5.
tests_run=$(grep -o 'Tests run: [0-9]\+' test_output.txt | grep -o '[0-9]\+')
failures=$(grep -o 'Failures: [0-9]\+' test_output.txt | grep -o '[0-9]\+')
tests_run=${tests_run:-0}
failures=${failures:-0}

let success=tests_run-failures

# Report the results
echo "Total tests run: $tests_run"
echo "Total successes: $success"
echo "Total failures: $failures"

if [ "$tests_run" -ne 0 ]; then
  let grade=100*success/tests_run
else
  let grade=0
fi

echo "Grade: $grade%"