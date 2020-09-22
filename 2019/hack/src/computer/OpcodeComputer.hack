class OpcodeComputer {
    protected int $cursorPos = 0;
    protected dict<int, int> $memory = dict[];

    public function __toString(): string {
        $output = '';

        foreach ($this->memory as $position => $value) {
            $output .= "[$position] $value" . PHP_EOL;
        }

        return $output;
    }

    public function loadMemory(vec<int> $data): dict<int, int> {
        $this->memory = dict[];

        foreach ($data as $idxData => $dataValue) {
            $this->memory[$idxData] = $dataValue;
        }

        return $this->memory;
    }
}