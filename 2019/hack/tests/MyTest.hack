use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class MyTest extends HackTest {
    public function provideSquareVec(): vec<(vec<num>, vec<num>)> {
        return vec [
            tuple(vec[1, 2], vec[1, 4]),
            tuple(vec[-3, -4], vec[9, 16]),
            tuple(vec[5.5, 6.6], vec[pow(5.5, 2), pow(6.6, 2)]),
            tuple(vec[-7.7, -8.8], vec[pow(7.7, 2), pow(8.8, 2)]),
            tuple(vec[0, 0.0], vec[0, 0.0]),
        ];
    }

    <<DataProvider('provideSquareVec')>>
    public function testSquareVec(vec<num> $testValues, vec<num> $expectedResults): void {
        expect(square_vec($testValues))->toBeSame($expectedResults);
    }
}
