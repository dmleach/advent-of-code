#!/usr/bin/env hhvm

// use function HH\Lib\OS\{open, close};

<<__EntryPoint>>
async function go(): Awaitable<void> {
    require_once(__DIR__ . '/../vendor/autoload.hack');
    \Facebook\AutoloadMap\initialize();

    $solver = new Solver01();
    await $solver->solve();

    // $data = PuzzleData::get_data_01();

    // $startTime = microtime(true);

    // $individualFuelAwaitables = vec[];
    // $totalFuelAwaitables = vec[];
    // $index = 0;

    // foreach ($data as $moduleMass) {
    //     $index++;
    //     $individualFuelAwaitables[] = FuelCalculator::getFuelByIndividualMass($moduleMass);
    //     $totalFuelAwaitables[] = FuelCalculator::getFuelByMass($moduleMass, $index);
    // }

    // $individualFuelValues = await HH\Lib\Vec\from_async($individualFuelAwaitables);
    // $totalFuelValues = await HH\Lib\Vec\from_async($totalFuelAwaitables);
    
    // echo "The fuel needed for the initial mass is " . array_sum($individualFuelValues) . PHP_EOL;
    // echo "The total fuel needed for the rocket is " . array_sum($totalFuelValues) . PHP_EOL;

    // $endTime = microtime(true);
    // $elapsedTime = $endTime - $startTime;
    // echo "The script took $elapsedTime seconds to execute asynchronously" . PHP_EOL;

    // $startTime = microtime(true);

    // $individualFuel = vec[];
    // $totalFuel = vec[];
    // $index = 0;

    // foreach ($data as $moduleMass) {
    //     $index++;
    //     $individualFuel[] = FuelCalculator::getFuelByIndividualMassBlocking($moduleMass);
    //     $totalFuel[] = FuelCalculator::getFuelByMassBlocking($moduleMass, $index);
    // }

    // echo "The fuel needed for the initial mass is " . array_sum($individualFuel) . PHP_EOL;
    // echo "The total fuel needed for the rocket is " . array_sum($totalFuel) . PHP_EOL;

    // $endTime = microtime(true);
    // $elapsedTime = $endTime - $startTime;
    // echo "The script took $elapsedTime seconds to execute blocking" . PHP_EOL;
}

