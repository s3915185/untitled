package com.example.mcp_untitled_server.userInfo;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class UserInfoServiceImpl implements UserInfoService {

    private final UserInfoRepository userInfoRepository;

    @Override
    public UserInfoDTO addNewAccount(UserInfoDTO newUser) {
        UserInfo userInfo = UserInfoMapper.INSTANCE.toEntity(newUser);
        return UserInfoMapper.INSTANCE.toDto(userInfoRepository.save(userInfo));
    }

    @Override
    public UserInfoDTO modifyAccount(UserInfoDTO modifiedAccount) {
        UserInfo storedElement = userInfoRepository.findById(modifiedAccount.getId())
                .orElseThrow();
        UserInfoMapper.INSTANCE.updateEntityFromDto(storedElement, modifiedAccount);
        return UserInfoMapper.INSTANCE.toDto(userInfoRepository.save(storedElement));
    }

    @Override
    public UserInfoDTO getAccountInfoById(Long userInfoId) {
        return UserInfoMapper.INSTANCE.toDto(userInfoRepository.findById(userInfoId)
                .orElseThrow());
    }
}
