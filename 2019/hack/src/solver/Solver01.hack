class Solver01 extends BaseSolver {
    public async function execute(): Awaitable<void> {
        $data = PuzzleData::get_data_01();

        $individualFuelAwaitables = vec[];
        $totalFuelAwaitables = vec[];
        $index = 0;

        foreach ($data as $moduleMass) {
            $index++;
            $individualFuelAwaitables[] = self::getFuelByIndividualMass($moduleMass);
            $totalFuelAwaitables[] = self::getFuelByMass($moduleMass, $index);
        }

        $individualFuelValues = await HH\Lib\Vec\from_async($individualFuelAwaitables);
        $totalFuelValues = await HH\Lib\Vec\from_async($totalFuelAwaitables);
        
        echo "The fuel needed for the initial mass is " . array_sum($individualFuelValues) . PHP_EOL;
        echo "The total fuel needed for the rocket is " . array_sum($totalFuelValues) . PHP_EOL;
    }

    public static async function getFuelByIndividualMass(int $moduleMass): Awaitable<int> {
        await HH\Asio\usleep($moduleMass);
        return intval($moduleMass / 3) - 2;
    }

    public static async function getFuelByMass(int $moduleMass, int $index = -1): Awaitable<int> {
        $individualFuel = await self::getFuelByIndividualMass($moduleMass);

        if ($individualFuel <= 0) {
            return 0;
        }

        return $individualFuel + await self::getFuelByMass($individualFuel, $index);
    }
}