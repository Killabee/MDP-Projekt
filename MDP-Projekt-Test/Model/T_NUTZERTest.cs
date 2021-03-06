﻿using MDP_Projekt.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace MDP_Projekt_Test
{
    
    
    /// <summary>
    ///This is a test class for T_NUTZERTest and is intended
    ///to contain all T_NUTZERTest Unit Tests
    ///</summary>
    [TestClass()]
    public class T_NUTZERTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for T_NUTZER Constructor
        ///</summary>
        [TestMethod()]
        public void T_NUTZERConstructorTest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for CreateT_NUTZER
        ///</summary>
        [TestMethod()]
        public void CreateT_NUTZERTest()
        {
            int nUT_ID = 0; // TODO: Initialize to an appropriate value
            string nUT_NAME = string.Empty; // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.T_NUTZER expected = null; // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.T_NUTZER actual;
            actual = MDP_Projekt.Model.T_NUTZER.CreateT_NUTZER(nUT_ID, nUT_NAME);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for NUT_ID
        ///</summary>
        [TestMethod()]
        public void NUT_IDTest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            target.NUT_ID = expected;
            actual = target.NUT_ID;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for NUT_NAME
        ///</summary>
        [TestMethod()]
        public void NUT_NAMETest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.NUT_NAME = expected;
            actual = target.NUT_NAME;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for NUT_ORT
        ///</summary>
        [TestMethod()]
        public void NUT_ORTTest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.NUT_ORT = expected;
            actual = target.NUT_ORT;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for NUT_PLZ
        ///</summary>
        [TestMethod()]
        public void NUT_PLZTest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER(); // TODO: Initialize to an appropriate value
            System.Nullable<int> expected = new System.Nullable<int>(); // TODO: Initialize to an appropriate value
            System.Nullable<int> actual;
            target.NUT_PLZ = expected;
            actual = target.NUT_PLZ;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for T_FAHRZEUG
        ///</summary>
        [TestMethod()]
        public void T_FAHRZEUGTest()
        {
            MDP_Projekt.Model.T_NUTZER target = new MDP_Projekt.Model.T_NUTZER(); // TODO: Initialize to an appropriate value
            System.Data.Objects.DataClasses.EntityCollection<MDP_Projekt.Model.T_FAHRZEUG> expected = null; // TODO: Initialize to an appropriate value
            System.Data.Objects.DataClasses.EntityCollection<MDP_Projekt.Model.T_FAHRZEUG> actual;
            target.T_FAHRZEUG = expected;
            actual = target.T_FAHRZEUG;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
