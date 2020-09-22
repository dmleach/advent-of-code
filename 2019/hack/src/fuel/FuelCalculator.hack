class FuelCalculator {
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

    public static function getFuelByIndividualMassBlocking(int $moduleMass): int {
        usleep($moduleMass);
        return intval($moduleMass / 3) - 2;
    }

    public static function getFuelByMassBlocking(int $moduleMass, int $index = -1): int {
        $individualFuel = self::getFuelByIndividualMassBlocking($moduleMass);

        if ($individualFuel <= 0) {
            return 0;
        }

        return $individualFuel + self::getFuelByMassBlocking($individualFuel, $index);
    }
}