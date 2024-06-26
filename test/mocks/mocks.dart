import 'package:flutter/material.dart';
import '../features/auth/mocks/auth_mocks.dart';
import '../features/meetings/mocks/meetings_mocks.dart';
//DO-NOT-REMOVE IMPORTS_MOCKS

import 'mock_definitions.dart';

class Mocks {

  // MVP

  //DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES
  
  //DO-NOT-REMOVE USE_CASE_MOCKS_STATIC_FIELD

  // REPOSITORIES
  
  //DO-NOT-REMOVE REPOSITORIES_MOCKS_STATIC_FIELD

  // STORES

  //DO-NOT-REMOVE STORES_MOCKS_STATIC_FIELD

  static void init() {
AuthMocks.init();
MeetingsMocks.init();
//DO-NOT-REMOVE FEATURE_MOCKS_INIT

    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    //DO-NOT-REMOVE FEATURES_MOCKS

    // MVP

    //DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
  
    //DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
    
    //DO-NOT-REMOVE REPOSITORIES_INIT_MOCKS

    // STORES
    
    //DO-NOT-REMOVE STORES_INIT_MOCKS
  }

  static void _initFallbacks() {
    //DO-NOT-REMOVE FEATURES_FALLBACKS
    
    // MVP

    //DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES

    //DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    
    //DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES

    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE
  }
}
