<?php

declare(strict_types=1);

namespace Example\Test;

use Example\Application;
use PHPUnit\Framework\TestCase;

class ApplicationTest extends TestCase
{
    private $application;

    public function setUp()
    {
        $this->application = new Application();
    }

    public function testWillOutputHelloWorld()
    {
        $this->expectOutputString('Hello World!');

        $this->application->run();
    }
}
