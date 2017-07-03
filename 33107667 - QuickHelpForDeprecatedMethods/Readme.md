## Summary:

The documentation of a method shows up just fine in the quick help when option-clicking it. However as soon as you mark a method as deprecated either by adding the `DEPRECATED_ATTRIBUTE` or the ` __attribute__((deprecated("Foo”)))` attribute to it, quick help only shows ‘Symbol not found‘.

## Steps to Reproduce:

0. Open the attached sample project.
1. Open AppDelegate.m
2. option-click on `doSomething:`

## Expected Results:

The quick help shows the information provided in `ViewController.h`

## Actual Results:

Quick help shows ‘Symbol not found‘.

## Version:

8.0

## Notes:

This can be fixed by simply commenting out ` __attribute__((deprecated("Foo”)))` in `ViewController.h`.

As a side note: Quick help in Xcode 9 seems to not work at all as of beta 2, so I assume this behavior is not fixed in Xcode 9 yet.