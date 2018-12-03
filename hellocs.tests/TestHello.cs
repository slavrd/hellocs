using System;
using hellocs;
using Xunit;

namespace hellocs.tests
{
    public class TestHello
    {
        [Fact]
        public void TestIfHello()
        {
            string expectedValue = "hello";
            bool result = Program.ReturnHello().Equals(expectedValue); 
            Assert.True(result, $"hellocs.ReturnHello did not return {expectedValue}");
        }
    }
}
