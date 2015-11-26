package org.common.util;

import static org.junit.Assert.*;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

public class GenerateIdServiceTest {

  private int validServerId = (int) GenerateIdService.SERVER_ADD_MS_SPEND_LIMIT / GenerateIdService.MS_SPEND_LIMIT - 1;

  @Rule
  public ExpectedException expectedEx = ExpectedException.none();

//  @Test
//  public void test() {
//    fail("Not yet implemented");
//  }

  @Test
  public void testServerIdGtMax() {
    expectedEx.expect(IllegalArgumentException.class);
    expectedEx.expectMessage(GenerateIdService.EXCEPTION_SERVER_ID_INVALID);
    GenerateIdService.generateNew((int) GenerateIdService.SERVER_ADD_MS_SPEND_LIMIT / GenerateIdService.MS_SPEND_LIMIT
        + 2, "", 1);
  }

  @Test
  public void testServerIdLessOne() {
    expectedEx.expect(IllegalArgumentException.class);
    expectedEx.expectMessage(GenerateIdService.EXCEPTION_SERVER_ID_INVALID);
    GenerateIdService.generateNew(0, "", 1);
  }

  @Test(expected = NullPointerException.class)
  public void testServerKeyCanNotNull() {
    GenerateIdService.generateNew(validServerId, null, 1);
  }

  @Test
  public void testServerStepGtMax() {
    expectedEx.expect(IllegalArgumentException.class);
    expectedEx.expectMessage(GenerateIdService.EXCEPTION_STEP_INVALID);
    GenerateIdService.generateNew(validServerId, "", GenerateIdService.MS_SPEND_LIMIT);
  }

  @Test
  public void testServerStepLessMin() {
    expectedEx.expect(IllegalArgumentException.class);
    expectedEx.expectMessage(GenerateIdService.EXCEPTION_STEP_INVALID);
    GenerateIdService.generateNew(validServerId, "", 0);
  }
  @Test
  public void testServerOverLoad() {
    expectedEx.expect(Exception.class);
    expectedEx.expectMessage(GenerateIdService.EXCEPTION_OVERLOAD);
    GenerateIdService.generateNew(validServerId, "", GenerateIdService.MS_SPEND_LIMIT-1);
    GenerateIdService.generateNew(validServerId, "", GenerateIdService.MS_SPEND_LIMIT-1);
    GenerateIdService.generateNew(validServerId, "", GenerateIdService.MS_SPEND_LIMIT-1);
    GenerateIdService.generateNew(validServerId, "", GenerateIdService.MS_SPEND_LIMIT-1);
  }

}
