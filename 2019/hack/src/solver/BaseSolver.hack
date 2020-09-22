abstract class BaseSolver {
    protected float $endTime = 0.0;
    protected float $startTime = 0.0;

    abstract public function execute(): Awaitable<void>;

    public async function solve(): Awaitable<void> {
        $this->startTime = microtime(true);
        await $this->execute();
        $this->endTime = microtime(true);
    }
}