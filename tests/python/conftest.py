#!/usr/bin/env python
# Copyright (c) 2017 Angel Terrones (<angelterrones@gmail.com>)

import glob


def pytest_addoption(parser):
    parser.addoption('--slow', action='store_true', default=False)


def pytest_generate_tests(metafunc):
    list_cf  = glob.glob("tests/settings/*.ini")
    if metafunc.config.getoption('--slow'):
        list_elf = glob.glob("tests/benchmarks/*.riscv")
    else:
        list_elf = glob.glob("tests/riscv-tests/rv32mi-p-[!b]*.elf")  # ignore breakpoint tests
        list_elf = list_elf + glob.glob("tests/riscv-tests/rv32ui-p-*.elf")
    metafunc.parametrize('config_file', list_cf)
    metafunc.parametrize('elf', list_elf)

# Local Variables:
# flycheck-flake8-maximum-line-length: 120
# flycheck-flake8rc: ".flake8rc"
# End:
